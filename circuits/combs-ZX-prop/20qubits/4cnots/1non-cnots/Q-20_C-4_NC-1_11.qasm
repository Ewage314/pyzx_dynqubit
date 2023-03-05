OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
x q[18];
cx q[8], q[6];
cx q[10], q[3];
cx q[19], q[11];
cx q[16], q[2];
