OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[15], q[14];
cx q[17], q[18];
cx q[6], q[11];
z q[19];
cx q[14], q[2];
