OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[19];
cx q[8], q[18];
x q[7];
cx q[8], q[10];
cx q[7], q[6];
