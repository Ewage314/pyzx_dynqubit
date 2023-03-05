OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
x q[10];
cx q[17], q[18];
cx q[0], q[8];
cx q[11], q[14];
cx q[14], q[6];
