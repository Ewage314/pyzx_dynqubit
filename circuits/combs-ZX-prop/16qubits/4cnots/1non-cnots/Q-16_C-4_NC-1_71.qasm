OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[2];
cx q[7], q[11];
cx q[9], q[12];
cx q[8], q[0];
cx q[5], q[14];
