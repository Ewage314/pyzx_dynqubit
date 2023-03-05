OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[19];
cx q[14], q[3];
z q[19];
cx q[7], q[1];
x q[9];
cx q[3], q[12];
