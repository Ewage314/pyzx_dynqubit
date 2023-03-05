OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
x q[7];
cx q[8], q[12];
cx q[11], q[7];
cx q[12], q[18];
cx q[10], q[1];
