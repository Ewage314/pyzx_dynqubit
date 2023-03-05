OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[0], q[13];
cx q[0], q[4];
cx q[0], q[3];
cx q[15], q[6];
