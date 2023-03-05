OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[11];
cx q[3], q[12];
x q[14];
x q[3];
cx q[11], q[17];
cx q[19], q[18];
