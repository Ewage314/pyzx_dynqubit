// Initial wiring: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
// Resulting wiring: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[14];
cx q[2], q[11];
cx q[13], q[3];
cx q[3], q[1];
cx q[4], q[10];
cx q[14], q[12];
cx q[5], q[7];
cx q[2], q[9];
