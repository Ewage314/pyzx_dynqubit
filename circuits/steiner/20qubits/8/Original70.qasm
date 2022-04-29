// Initial wiring: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
// Resulting wiring: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[19];
cx q[0], q[19];
cx q[3], q[15];
cx q[15], q[13];
cx q[12], q[1];
cx q[11], q[0];
cx q[0], q[6];
cx q[11], q[6];
