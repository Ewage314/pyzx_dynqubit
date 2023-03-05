OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
x q[4];
cx q[18], q[9];
cx q[1], q[7];
cx q[7], q[14];
cx q[3], q[14];
