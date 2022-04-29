// Initial wiring: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
// Resulting wiring: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[12];
cx q[10], q[3];
cx q[10], q[7];
cx q[10], q[2];
cx q[16], q[6];
cx q[16], q[12];
cx q[0], q[4];
cx q[11], q[6];
