OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[15];
x q[0];
cx q[5], q[14];
cx q[15], q[1];
cx q[4], q[5];
