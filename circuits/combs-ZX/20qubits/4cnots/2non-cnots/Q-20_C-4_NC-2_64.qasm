OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
x q[18];
cx q[19], q[0];
cx q[8], q[4];
cx q[11], q[19];
z q[19];
cx q[1], q[15];
