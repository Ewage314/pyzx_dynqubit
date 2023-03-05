OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
x q[14];
cx q[14], q[0];
cx q[17], q[15];
cx q[11], q[3];
cx q[6], q[17];
