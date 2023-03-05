OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[12];
cx q[7], q[0];
cx q[9], q[14];
cx q[5], q[6];
cx q[6], q[13];
