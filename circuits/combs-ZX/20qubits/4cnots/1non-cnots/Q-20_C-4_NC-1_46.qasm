OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[18];
cx q[18], q[0];
x q[19];
cx q[7], q[10];
cx q[13], q[11];
