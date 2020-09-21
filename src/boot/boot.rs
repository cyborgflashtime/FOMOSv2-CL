use core::ptr;

pub(crate) fn boot() {
    const UART0: *mut u8 = 0x0900_0000 as *mut u8;
    let out_str = b"Booting... \n";
    for byte in out_str {
        unsafe {
            ptr::write_volatile(UART0, *byte);
        }
    }
    // anything you want to run on startup put in here
}
