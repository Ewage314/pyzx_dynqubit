OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[9];
cx q[18], q[14];
cx q[14], q[6];
x q[12];
cx q[12], q[1];
