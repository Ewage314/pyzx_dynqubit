OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[1];
cx q[0], q[7];
cx q[3], q[7];
x q[4];
cx q[4], q[13];
