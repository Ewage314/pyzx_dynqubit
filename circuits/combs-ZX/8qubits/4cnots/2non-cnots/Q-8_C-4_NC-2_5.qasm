OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
x q[6];
cx q[6], q[3];
cx q[3], q[2];
z q[5];
cx q[3], q[5];
cx q[0], q[7];
