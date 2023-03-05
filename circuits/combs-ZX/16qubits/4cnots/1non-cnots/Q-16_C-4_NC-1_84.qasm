OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[5];
z q[6];
cx q[1], q[3];
cx q[12], q[7];
cx q[15], q[14];
