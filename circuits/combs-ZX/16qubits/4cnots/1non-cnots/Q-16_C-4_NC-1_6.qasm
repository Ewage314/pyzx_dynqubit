OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[11];
cx q[10], q[13];
x q[1];
cx q[12], q[6];
cx q[0], q[14];
