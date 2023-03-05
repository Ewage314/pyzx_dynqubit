OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[2];
x q[3];
cx q[12], q[1];
cx q[15], q[0];
cx q[13], q[4];
