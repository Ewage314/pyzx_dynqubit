OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[0];
cx q[9], q[13];
cx q[11], q[3];
cx q[4], q[11];
