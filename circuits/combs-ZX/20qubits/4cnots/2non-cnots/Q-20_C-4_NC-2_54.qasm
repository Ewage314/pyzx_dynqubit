OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[18], q[15];
x q[10];
cx q[3], q[15];
x q[11];
cx q[2], q[15];
cx q[14], q[3];
