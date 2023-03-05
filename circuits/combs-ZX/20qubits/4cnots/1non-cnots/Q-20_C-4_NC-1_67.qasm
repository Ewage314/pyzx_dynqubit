OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[19], q[7];
z q[7];
cx q[3], q[4];
cx q[7], q[14];
cx q[3], q[14];
