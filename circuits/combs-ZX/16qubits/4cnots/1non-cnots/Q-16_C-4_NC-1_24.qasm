OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[8];
cx q[0], q[6];
cx q[0], q[3];
cx q[11], q[8];
cx q[6], q[15];
