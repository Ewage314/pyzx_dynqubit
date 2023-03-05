OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[4];
cx q[11], q[14];
cx q[14], q[2];
cx q[7], q[14];
cx q[0], q[15];
