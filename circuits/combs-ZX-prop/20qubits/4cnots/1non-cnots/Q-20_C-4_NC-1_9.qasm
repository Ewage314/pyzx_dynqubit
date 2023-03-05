OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[18];
cx q[0], q[3];
x q[18];
cx q[11], q[10];
cx q[5], q[12];
