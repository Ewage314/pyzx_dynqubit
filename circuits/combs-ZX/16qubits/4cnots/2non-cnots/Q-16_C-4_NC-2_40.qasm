OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[11];
cx q[6], q[9];
cx q[4], q[14];
z q[7];
z q[1];
cx q[9], q[0];
