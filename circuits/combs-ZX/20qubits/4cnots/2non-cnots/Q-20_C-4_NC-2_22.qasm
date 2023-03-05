OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
x q[0];
z q[17];
cx q[14], q[9];
cx q[8], q[12];
cx q[0], q[13];
cx q[14], q[18];
