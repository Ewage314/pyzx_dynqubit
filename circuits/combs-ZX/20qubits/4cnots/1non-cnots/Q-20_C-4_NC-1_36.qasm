OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[16], q[1];
cx q[10], q[9];
cx q[11], q[7];
x q[18];
cx q[7], q[5];
