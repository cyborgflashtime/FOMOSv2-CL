// this file will start running all the drivers

use core::ptr;

pub(crate) fn setup() {
    const UART0: *mut u8 = 0x0900_0000 as *mut u8;
    let out_str = b"Starting setup... \n";
    for byte in out_str {
        unsafe {
            ptr::write_volatile(UART0, *byte);
        }
    }
    // add stuff to make input stuff work
}