OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
x q[0];
cx q[1], q[8];
cx q[11], q[18];
z q[2];
cx q[15], q[1];
cx q[14], q[5];
