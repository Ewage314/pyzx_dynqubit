OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[7];
x q[6];
cx q[4], q[1];
cx q[9], q[1];
cx q[9], q[7];
cx q[3], q[7];
