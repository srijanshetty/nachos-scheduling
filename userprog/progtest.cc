// progtest.cc 
//	Test routines for demonstrating that Nachos can load
//	a user program and execute it.  
//
//	Also, routines for testing the Console hardware device.
//
// Copyright (c) 1992-1993 The Regents of the University of California.
// All rights reserved.  See copyright.h for copyright notice and limitation 
// of liability and disclaimer of warranty provisions.

#include "copyright.h"
#include "system.h"
#include "console.h"
#include "addrspace.h"
#include "synch.h"

void
BatchStartFunction(int dummy)
{
   currentThread->Startup();
   DEBUG('b', "Running thread \"%d\" for the first time\n", currentThread->GetPID());
   machine->Run();
}

//----------------------------------------------------------------------
// StartProcess
// 	Run a user program.  Open the executable, load it into
//	memory, and jump to it.
//----------------------------------------------------------------------

void
StartProcess(char *filename)
{
    OpenFile *executable = fileSystem->Open(filename);
    AddrSpace *space;

    if (executable == NULL) {
        printf("Unable to open file %s\n", filename);
        return;
    }
    space = new AddrSpace(executable);    
    currentThread->space = space;

    delete executable;			// close file

    space->InitRegisters();		// set the initial register values
    space->RestoreState();		// load page table register

    machine->Run();			// jump to the user progam
    ASSERT(FALSE);			// machine->Run never returns;
    // the address space exits
    // by doing the syscall "exit"
}


//----------------------------------------------------------------------
// RunBatchProcess 
// Run a batch of processes
//----------------------------------------------------------------------

void
RunBatchProcess(char *filename) {
    // Open the given executable
    OpenFile *executable = fileSystem->Open(filename);
    if (executable == NULL) {
        printf("Unable to open file %s\n", filename);
        return;
    }

    // Compute the length of the file and then read that much from the file
    int filelength = executable->Length();
    char buffer[filelength];
    OpenFile *programfile;
    Thread *thread;

    // Read the executable
    executable->ReadAt(buffer, (filelength-1), 0);
    DEBUG('b', "running batch jobs from \"%s\"\n", filename);
   
    // Create threads and enque them
    int i=0, k=0;
    char name[100];
    char priority[10];

    // Read the names of the different programs and create a thread for each of
    // them, then yield the currently executing thread
    while(i<filelength){
        // If no priority is supplied by a thread then we assign a default priority of 100
        if(buffer[i]=='\n') {
            name[k]='\0';
            k=0; ++i;

            // Creating a new thread and enquing it
            programfile = fileSystem->Open(name);
            ASSERT(programfile != NULL);
            thread = new Thread(name, 100, true);
            thread->space = new AddrSpace(programfile);  // Duplicates the address space
            thread->space->InitRegisters();		// set the initial register values
            thread->SaveUserState();		// load page table register
            thread->StackAllocate(BatchStartFunction, 0);	// Make it ready for a later context switch
            thread->Schedule();
            delete programfile;			// close file
        } else {
            // This is the normal case when priority has been suplied
            if(buffer[i]!=' '){
                name[k]=buffer[i];
                ++i; ++k;
            } else {
                name[k]='\0';
                k=0; ++i;
                while(buffer[i]!='\n') {
                    priority[k]=buffer[i];
                    ++i; ++k;
                }
                priority[k]='\0';
                k=0; ++i;

                // Creating a new thread and enquing it
                programfile = fileSystem->Open(name);
                ASSERT(programfile != NULL);
                thread = new Thread(name, atoi(priority), true);
                thread->space = new AddrSpace(programfile);  // Duplicates the address space
                thread->space->InitRegisters();		// set the initial register values
                thread->SaveUserState();		// load page table register
                thread->StackAllocate(BatchStartFunction, 0);	// Make it ready for a later context switch
                thread->Schedule();
                delete programfile;			// close file
            }
        }
    }

    // This thread has no more work to do, delete it
    currentThread->Finish();
}

// Data structures needed for the console test.  Threads making
// I/O requests wait on a Semaphore to delay until the I/O completes.

static Console *console;
static Semaphore *readAvail;
static Semaphore *writeDone;

//----------------------------------------------------------------------
// ConsoleInterruptHandlers
// 	Wake up the thread that requested the I/O.
//----------------------------------------------------------------------

static void ReadAvail(int arg) { readAvail->V(); }
static void WriteDone(int arg) { writeDone->V(); }

//----------------------------------------------------------------------
// ConsoleTest
// 	Test the console by echoing characters typed at the input onto
//	the output.  Stop when the user types a 'q'.
//----------------------------------------------------------------------

    void 
ConsoleTest (char *in, char *out)
{
    char ch;

    console = new Console(in, out, ReadAvail, WriteDone, 0);
    readAvail = new Semaphore("read avail", 0);
    writeDone = new Semaphore("write done", 0);

    for (;;) {
        readAvail->P();		// wait for character to arrive
        ch = console->GetChar();
        console->PutChar(ch);	// echo it!
        writeDone->P() ;        // wait for write to finish
        if (ch == 'q') return;  // if q, quit
    }
}
