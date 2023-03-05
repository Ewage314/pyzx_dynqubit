OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[4];
cx q[18], q[7];
x q[6];
cx q[13], q[4];
cx q[17], q[14];
