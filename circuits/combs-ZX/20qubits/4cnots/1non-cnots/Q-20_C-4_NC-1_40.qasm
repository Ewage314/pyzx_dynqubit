OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[17], q[18];
x q[0];
cx q[7], q[11];
cx q[4], q[14];
cx q[14], q[6];
