OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[2];
cx q[14], q[10];
x q[12];
cx q[5], q[13];
cx q[10], q[8];
