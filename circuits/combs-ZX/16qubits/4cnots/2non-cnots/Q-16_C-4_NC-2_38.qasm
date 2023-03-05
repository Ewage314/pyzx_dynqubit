OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[2];
z q[14];
x q[12];
cx q[14], q[0];
cx q[10], q[13];
cx q[12], q[11];
