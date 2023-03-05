OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[13];
cx q[10], q[0];
x q[11];
cx q[10], q[6];
cx q[12], q[5];
