OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[7];
x q[15];
cx q[4], q[0];
cx q[7], q[0];
cx q[19], q[7];
