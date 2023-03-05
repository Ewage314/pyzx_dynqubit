OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[19], q[4];
x q[14];
cx q[19], q[7];
z q[11];
cx q[12], q[0];
cx q[0], q[18];
