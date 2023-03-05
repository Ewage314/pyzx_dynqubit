OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[17];
z q[18];
cx q[15], q[1];
x q[6];
cx q[9], q[17];
cx q[7], q[6];
