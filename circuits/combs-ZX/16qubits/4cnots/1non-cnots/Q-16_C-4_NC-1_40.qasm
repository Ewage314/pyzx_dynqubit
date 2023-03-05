OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[3];
z q[15];
cx q[14], q[9];
cx q[13], q[0];
cx q[10], q[14];
