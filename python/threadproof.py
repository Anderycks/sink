"""Thread concepts proven out in code.

There are 3 ways to run this script:
 * non-blocking -- Execute fib in pseudo-parallel
 * blocking -- Execute fib serially
 * one-and-only-one -- Execute fib only once per script run

To run fib in pseudo parallel without any thread locks,
simply run it with no args:

  $ python threadproof.py

To run fib using locks and force the fib attempts to
be serially executed, run the script with a "lock"
argument:

  $ python threadproof.py lock

To run fib once and only once per script run, use the
"prevent" argument:

  $ python threadproof.py prevent

The code below has been commented to show how each of these
types of runs are possible. It's also worth reading the output
of each type of run to see what this means for thread execution.
"""

import sys
import threading


TOP_LOCK = threading.Lock()

def fib(num, attempt, with_lock, prevent):
    """Print the Fibonacci series up to num.

    with_lock determines if we use thread locks
    to block execution of subsequent attempts.

    prevent determines if we prevent all but one
    attempt while the lock is active.

    Execution of this function is controlled by thread locks.
    See the top-level docstring above for explanation.
    """

    # There is nothing about the threading module that will
    # prevent code running as many times as it's called.
    # If we only want to run code once, we have to take care
    # to prevent this.
    #
    # But do notice, this will only prevent multiple runs
    # ***while*** the current lock is active. Once that lock
    # is released, we could still execute the code again, i.e.
    # as many times as this threadproof script is run with the
    # "prevent" argument.
    if prevent and TOP_LOCK.locked():
        return

    if with_lock:
        TOP_LOCK.acquire()

    print 'Starting attempt %d\n' % attempt
    start, end = 0, 1
    while end < num:
        print end
        start, end = end, start+end
    print 'Finished attempt %d\n' % attempt

    if with_lock:
        TOP_LOCK.release()
    print ''


def main(args):
    """Build a list of fib threads and execute them."""

    # If we have any arguments beside the script name passed in,
    # then setup the arguments passed to fib.
    lock_arg = ''
    if len(args) > 1:
        lock_arg = args[1]

    # The default is non-blocking, non-single runs.
    with_lock = False
    prevent = False

    # with_lock means only using blocking locks.
    if lock_arg == 'lock':
        with_lock = True
    # prevent means block and run only once.
    # We have to block to acquire the lock initially,
    # and then we can prevent any subsequent runs.
    elif lock_arg == 'prevent':
        with_lock = True
        prevent = True

    # Run 3 versions of the same function,
    # using a different thread for each.
    queue = []
    for index in range(0, 3):
        # Use a high-end value for limiting the fib sequence
        # both to slow the function and to better demonstrate
        # how this is working.
        runner = threading.Thread(
            target=fib, args=(1000000000, index, with_lock, prevent))
        queue.append(runner)

    for item in queue:
        item.start()


if __name__ == '__main__':
    main(sys.argv)
