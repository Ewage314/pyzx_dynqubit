OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[4];
z q[15];
cx q[0], q[1];
x q[12];
cx q[18], q[19];
cx q[17], q[18];
