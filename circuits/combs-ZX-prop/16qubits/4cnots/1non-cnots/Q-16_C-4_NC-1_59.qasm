OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[6];
cx q[12], q[0];
x q[10];
cx q[6], q[13];
cx q[8], q[1];
