OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[5];
cx q[3], q[7];
x q[4];
cx q[13], q[6];
cx q[14], q[13];
