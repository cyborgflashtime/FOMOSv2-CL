// this file pretty much useless but don't delete it
use core::ptr;

pub(crate) fn arm_keyboard() {
    const UART0: *mut u8 = 0x0900_0000 as *mut u8;
    let out_str = b"keyboard.rs ";
    for byte in out_str {
        unsafe {
            ptr::write_volatile(UART0, *byte);
        }
    }
}