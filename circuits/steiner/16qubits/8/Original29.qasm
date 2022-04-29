// Initial wiring: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
// Resulting wiring: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[15], q[0];
cx q[10], q[0];
cx q[2], q[0];
cx q[15], q[5];
cx q[14], q[9];
cx q[1], q[7];
cx q[4], q[13];
cx q[11], q[4];
