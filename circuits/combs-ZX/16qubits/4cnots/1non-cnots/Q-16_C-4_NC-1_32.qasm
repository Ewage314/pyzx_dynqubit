OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[5];
x q[3];
cx q[3], q[1];
cx q[15], q[9];
cx q[6], q[13];
