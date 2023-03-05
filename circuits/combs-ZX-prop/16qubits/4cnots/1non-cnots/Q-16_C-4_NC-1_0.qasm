OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[8];
x q[15];
cx q[7], q[13];
cx q[6], q[5];
cx q[14], q[13];
